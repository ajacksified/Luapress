local templates = {['inc/style.css'] = [[body {
    margin: 0;
    font-family: Georgia;
    font-size: 20px;
    line-height: 32px;
    background: #F7F7F7;
    color: #444;
}

a {
    color: green;
    text-decoration: none;
    border-bottom: 1px solid transparent;
}
a:hover {
    border-bottom: 1px solid #D7D7D7;
}

.left {
    float: left;
}
.right {
    float: right;
}

div#wrap {
    margin: 0 auto;
    width: 800px;
}

div#header {
    float: left;
    width: 100%;
}
    div#header h1 {
        font-size: 30px;
        margin-top: 50px;
        margin-bottom: 0;
        float: left;
    }
        div#header h1 a {
            text-decoration: none;
            color: #1A1B1B;
            border: none;
        }
    div#header ul {
        margin: 0;
        padding: 0;
        float: left;
        clear: both;
    }
        div#header ul li {
            display: inline;
            list-style: none;
            margin-right: 5px;
        }
            div#header ul li.active a {
                border-bottom: 1px solid #000;
            }

div.post {
    float: left;
    width: 100%;
    margin-bottom: 30px;
}
    div.post h2 {
        font-size: 24px;
        margin-bottom: 0;
        font-weight: normal;
    }
        div.post h2 a {
            text-decoration: none;
        }
    div.post div.content {
        text-align: justify;
    }
    div.post div.meta {
        font-size: 12px;
        font-family: Verdana;
        text-transform: uppercase;
        border-top: 1px dotted #D7D7D7;
        padding-top: 0px;
        margin-top: 13px;
    }

div#footer {
    margin-bottom: 50px;
    font-size: 16px;
    border-top: 1px dotted #D7D7D7;
    padding-top: 5px;
    margin-top: 13px;
    float: left;
    width: 100%;
}]],['archive.lhtml'] = [[<? for k, post in pairs(self:get('posts')) do ?>
<div class="post">
    <h2><a href="<?=self:get('url') ?>/posts/<?=post.link ?>"><?=post.title ?></a></h2>
    <div class="meta"><?=os.date('%a, %d %B, %Y', post.time) ?></div>
</div>
<? end ?>]],['footer.lhtml'] = [[        <div class="biglinks">
            <? if self:get('previous_page') then ?><a class="left" href="<?=self:get('url') ?>/<?=self:get('previous_page') ?>">&larr; Previous Page</a><? end ?>
            <? if self:get('next_page') then ?><a class="right" href="<?=self:get('url') ?>/<?=self:get('next_page') ?>">Next Page &rarr;</a><? end ?>
        </div><!--end biglinks-->

        <div id="footer">
            <span class="left">Content &copy; Nobody, no rights reserved</span>
            <span class="right">Generated by <a href="https://github.com/Fizzadar/Luapress">Luapress</a></span>
        </div><!--end footer-->
    </div><!--end wrap-->
</body>
</html>]],['header.lhtml'] = [[<!DOCTYPE html>
<html>
<head>
    <!--meta-->
    <title><? if self:get('single') then ?><?=self:get('post').title ?> - <? end ?><? if self:get('page') then ?><?=self:get('page').title ?> - <? end ?><?=self:get('title') ?></title>
    <meta charset="UTF-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />

    <!--favicon-->
    <link rel="shortcut icon" href="" />
    <link rel="icon" href="" type="image/x-icon" />

    <!--style-->
    <link rel="stylesheet" href="<?=self:get('url') ?>/inc/template/style.css" />

    <!--script-->
    <script type="text/javascript">
    </script>
</head>
<body>

    <div id="wrap">
        <div id="header">
            <h1><a href="<?=self:get('url') ?>"><?=self:get('title') ?></a></h1>
            <ul>
                <?=self:get('page_links') ?>
                <li><a href="<?=self:get('url') ?>/index.xml">RSS Feed</a></li>
            </ul>
        </div><!--end header-->]],['page.lhtml'] = [[<div class="post">
    <h2><?=self:get('page').title ?></h2>
    <div class="content"><?=self:get('page').content ?></div>
</div>]],['post.lhtml'] = [[<div class="post">
    <h2><? if self:get('single') then ?><?=self:get('post').title ?><? else ?>
        <a href="<?=self:get('url') ?>/posts/<?=self:get('post').link ?>"><?=self:get('post').title ?></a>
    <? end ?></h2>
    <div class="content"><?=self:get('post').content ?></div>
    <div class="meta"><?=os.date('%a, %d %B, %Y', self:get('post').time) ?></div>
</div>]],} return templates
