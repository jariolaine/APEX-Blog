create or replace package "BLOG_XML"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions to generate and output RSS feed and sitemap
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 07.05.2019 - Created
--    Jari Laine 08.01.2020 - Removed categories sitemap
--    Jari Laine 08.01.2020 - Modified use ORDS and blog version 4
--    Jari Laine 09.04.2020 - Utilize blog_url functions parameter p_canonical
--    Jari Laine 17.05.2020 - Removed private function get_app_alias
--                            and constant c_pub_app_id
--                            Moved private function get_ords_service to blog_ords package
--    Jari Laine 23.05.2020 - Changed procedure sitemap_main to use table blog_pages
--                            Modifications to remove ORDS depency
--                            New procedures:
--                              sitemap_categories
--                              sitemap_archives
--                              sitemap_atags
--  Jari Laine 30.10.2021   - Changed procedure sitemap_main to use view apex_application_pages
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "rss.xml"
  procedure rss(
    p_rss_url   in varchar2,
    p_app_name  in varchar2,
    p_app_desc  in varchar2,
    p_lang      in varchar2 default 'en'
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "rss.xsl"
  procedure rss_xsl(
    p_ws_images in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-index.xml"
  procedure sitemap_index(
    p_app_id        in varchar2,
    p_app_page_id   in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-main.xml"
  procedure sitemap_main(
    p_app_id        in varchar2,
    p_page_group    in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-posts.xml"
  procedure sitemap_posts;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-categories.xml"
  procedure sitemap_categories;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-archives.xml"
  procedure sitemap_archives;
--------------------------------------------------------------------------------
-- Called from:
--  public app page 1003 Ajax Callback process "sitemap-tags.xml"
  procedure sitemap_tags;
--------------------------------------------------------------------------------
end "BLOG_XML";
/

create or replace package body "BLOG_XML"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss(
    p_rss_url   in varchar2,
    p_app_name  in varchar2,
    p_app_desc  in varchar2,
    p_lang      in varchar2 default 'en'
  )
  as
    l_xml           xmltype;
    l_rss           blob;
    l_app_id        varchar2(256);
    l_rss_url       varchar2(4000);
    l_xsl_url       varchar2(4000);
    l_home_url      varchar2(4000);
    l_app_name      varchar2(4000);
    l_app_desc      varchar2(4000);
    l_rss_version   constant varchar2(5) := '2.0';
  begin

    -- RSS feed URL
    l_rss_url   := coalesce(
       p_rss_url
      ,blog_util.get_attribute_value( 'G_RSS_URL' )
    );
    -- blog name
    l_app_name := coalesce(
       p_app_name
      ,blog_util.get_attribute_value( 'G_APP_NAME' )
    );
    -- rss feed description
    l_app_desc  := coalesce(
       p_app_desc
      ,blog_util.get_attribute_value( 'G_APP_DESC' )
    );
    -- blog home page absulute URL
    l_home_url  := blog_url.get_tab(
       p_app_page_id => 'HOME'
      ,p_canonical => 'YES'
    );
    -- rss transformations (XSLT)
    l_xsl_url := blog_util.get_attribute_value( 'G_RSS_XSL_URL' );

    -- generate RSS
    select xmlserialize( content xmlconcat(
      case when l_xsl_url is not null
      then xmlpi("xml-stylesheet",'type="text/xsl" href="' || l_xsl_url ||'" media="screen"')
      end,
      xmlelement(
        "rss", xmlattributes(
           l_rss_version as "version"
          ,'http://purl.org/dc/elements/1.1/' as "xmlns:dc"
          ,'http://www.w3.org/2005/Atom'      as "xmlns:atom"
        )
        ,xmlelement(
          "channel"
          ,xmlelement(
             "atom:link"
            ,xmlattributes(
               'self'                         as "rel"
              ,l_rss_url                      as "href"
              ,'application/rss+xml'          as "type"
            )
          )
          ,xmlforest(
             l_app_name                       as "title"
            ,l_home_url                       as "link"
            ,l_app_desc                       as "description"
            ,p_lang                           as "language"
          )
          ,xmlagg(
            xmlelement(
               "item"
              ,xmlelement( "title",       posts.post_title )
              ,xmlelement( "dc:creator",  posts.blogger_name )
              ,xmlelement( "category",    posts.category_title )
              ,xmlelement( "link",        blog_url.get_post(
                                             p_post_id    => posts.post_id
                                            ,p_canonical  => 'YES'
                                          )
              )
              ,xmlelement( "description", posts.post_desc )
              ,xmlelement( "pubDate", to_char( sys_extract_utc( posts.published_on ), 'Dy, DD Mon YYYY HH24:MI:SS "GMT"' ) )
              ,xmlelement( "guid", xmlattributes( 'false' as "isPermaLink" ), posts.post_id )
            ) order by posts.published_on desc
          )
        )
      )
    )
    as blob encoding 'UTF-8' indent size=2)
    into l_rss
    from blog_v_posts_last20 posts
    ;

    blog_util.download_file(
      p_blob_content    => l_rss
      ,p_mime_type      => 'application/xml'
      ,p_cache_control  => 'max-age=3600, public'
      ,p_charset        => 'UTF-8'
    );

  end rss;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure rss_xsl(
    p_ws_images in varchar2
  )
  as
    l_css varchar2(1024);
    l_xml xmltype;
    l_xsl blob;
  begin

    l_css := apex_util.host_url('APEX_PATH');
    l_css := substr( l_css, instr( l_css, '/', 1, 3 ) );
    l_css := l_css || p_ws_images;
    l_css := l_css || blog_util.get_attribute_value( 'G_RSS_XSL_CSS_URL' );

    l_xml :=
      sys.xmltype.createxml('
        <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
          <!-- This causes the HTML doctype (<!doctype hmlt>) to be rendered. -->
          <xsl:output method="html" doctype-system="about:legacy-compat" indent="yes" />
          <!-- Start matching at the Channel node within the XML RSS feed. -->
          <xsl:template match="/rss/channel">
            <html lang="en">
            <head>
              <meta charset="utf-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
              <title>
                <xsl:value-of select="title" />
              </title>
              <link rel="stylesheet" type="text/css" href="' || l_css || '" />
            </head>
            <body>
              <h1 class="title"><a href="{ link }"><xsl:value-of select="title" /></a></h1>
              <p class="description"><xsl:value-of select="description" /></p>
              <xsl:for-each select="./item">
                <article class="z-post">
                  <header class="z-post--header">
                    <h2><a href="{ link }"><xsl:value-of select="title" /></a></h2>
                  </header>
                  <p class="z-post--body"><xsl:value-of select="description" /></p>
                </article>
              </xsl:for-each>
            </body>
            </html>
          </xsl:template>
        </xsl:stylesheet>
      ')
    ;

    select xmlserialize(
      content l_xml
      as blob encoding 'UTF-8' indent size=2
    )
    into l_xsl
    from dual
    ;

    blog_util.download_file(
      p_blob_content    => l_xsl
      ,p_mime_type      => 'application/xml'
      ,p_cache_control  => 'max-age=315360000, immutable, public'
      ,p_charset        => 'UTF-8'
    );

  end rss_xsl;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_index(
    p_app_id        in varchar2,
    p_app_page_id   in varchar2
  )
  as
    l_xml     blob;
    l_url     varchar2(4000);
    l_build_option constant varchar2(256) := 'BLOG_FEATURE_SITEMAP';
  begin

    l_url := blog_url.get_tab(
       p_app_page_id  => p_app_page_id
      ,p_request      => 'application_process='
      ,p_canonical    => 'YES'
    );

    select xmlserialize( document
      xmlelement(
        "sitemapindex",
        xmlattributes( 'http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns" ),
        (
          xmlagg(
            xmlelement( "sitemap"
              ,xmlelement( "loc", l_url || t1.process_name )
            ) order by t1.execution_sequence
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from apex_application_page_proc t1
    where 1 = 1
    and t1.process_name != 'sitemap-index.xml'
    and t1.application_id = p_app_id
    and t1.page_id = p_app_page_id
    and t1.build_option = l_build_option
    and apex_util.get_build_option_status(
           p_application_id    => p_app_id
          ,p_build_option_name => l_build_option
        ) = 'INCLUDE'
    ;

    blog_util.download_file(
      p_blob_content    => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_cache_control  => 'max-age=3600, public'
      ,p_charset        => 'UTF-8'
    );

  end sitemap_index;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_main(
    p_app_id      in varchar2,
    p_page_group  in varchar2
  )
  as
    l_xml blob;
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes( 'http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns" ),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc", blog_url.get_tab(
                                     p_app_page_id => v1.page_alias
                                    ,p_canonical => 'YES'
                                  )
              )
            ) order by v1.page_id
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from apex_application_pages v1
    where 1 = 1
      and v1.application_id = p_app_id
      and v1.page_group = p_page_group
      and case
        when v1.build_option is null
        then 'INCLUDE'
        else  apex_util.get_build_option_status(
                 p_application_id    => p_app_id
                ,p_build_option_name => v1.build_option
              )
      end = 'INCLUDE'
    ;

    blog_util.download_file(
      p_blob_content    => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_cache_control  => 'max-age=3600, public'
      ,p_charset        => 'UTF-8'
    );

  end sitemap_main;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_posts
  as
    l_xml blob;
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc", blog_url.get_post(
                                     p_post_id    => posts.post_id
                                    ,p_canonical  => 'YES'
                                  )
              )
              ,XMLElement( "lastmod", to_char( sys_extract_utc( greatest( posts.published_on, posts.changed_on ) ), 'YYYY-MM-DD"T"HH24:MI:SS"+00:00""' ) )
            ) order by posts.published_on desc
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from blog_v_posts posts
    ;

    blog_util.download_file(
      p_blob_content    => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_cache_control  => 'max-age=3600, public'
      ,p_charset        => 'UTF-8'
    );

  end sitemap_posts;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_categories
  as
    l_xml blob;
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc", blog_url.get_category(
                                     p_category_id  => cat.category_id
                                    ,p_canonical    => 'YES'
                                  )
              )
            ) order by cat.display_seq desc
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from blog_v_categories cat
    ;

    blog_util.download_file(
      p_blob_content    => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_cache_control  => 'max-age=3600, public'
      ,p_charset        => 'UTF-8'
    );

  end sitemap_categories;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_archives
  as
    l_xml blob;
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc", blog_url.get_archive(
                                     p_archive_id => arc.archive_year
                                    ,p_canonical  => 'YES'
                                  )
              )
            ) order by arc.archive_year desc
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from blog_v_archive_year arc
    ;

    blog_util.download_file(
      p_blob_content    => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_cache_control  => 'max-age=3600, public'
      ,p_charset        => 'UTF-8'
    );

  end sitemap_archives;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure sitemap_tags
  as
    l_xml blob;
  begin

    select xmlserialize( document
      xmlelement(
        "urlset",
        xmlattributes('http://www.sitemaps.org/schemas/sitemap/0.9' as "xmlns"),
        (
          xmlagg(
            xmlelement( "url"
              ,xmlelement( "loc", blog_url.get_tag(
                                     p_tag_id     => tags.tag_id
                                    ,p_canonical  => 'YES'
                                  )
              )
            )
          )
        )
      )
    as blob encoding 'UTF-8' indent size=2)
    into l_xml
    from blog_v_tags tags
    ;

    blog_util.download_file(
      p_blob_content    => l_xml
      ,p_mime_type      => 'application/xml'
      ,p_cache_control  => 'max-age=3600, public'
      ,p_charset        => 'UTF-8'
    );

  end sitemap_tags;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_XML";
/
