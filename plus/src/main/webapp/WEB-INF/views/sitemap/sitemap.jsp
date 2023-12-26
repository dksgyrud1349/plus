<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.sitemap {
	display: inline-block;
	min-width: 100%;
	padding: 40px;
}

li a,
li a.multi:after {
    position: relative;
	display: block;
	margin: 0;
	padding: 15px;
	font-size: 14px;
	font-weight: bold;
	line-height: 16px;
	white-space: normal;
	color: #333;
	background-color: white;
	border: 1px solid #f5f5f5;
	border-top: 4px solid #95a5a6;
    z-index: 1;
}



li a.multi:after {
	content: " ";
	position: absolute;
	left: 6px;
	top: 6px;
	width: 100%;
	height: 100%;
	border-width: 2px;
	border-color: #eee;
	border-top-width: 0 !important;
	border-left-width: 0 !important;
	background-color: transparent;
	z-index: -1;
}

li a:before {
	content: " "attr(href)" ";
	display: block;
	text-transform: uppercase;
	font-size: 10px;
	font-weight: bold;
	word-wrap: break-word;
	color: #95a5a6;
}

li a small {
	display: block;
	font-weight: normal;
	font-size: 12px;
	margin-top: 10px;
}

.sitemap .fa {
	position: absolute;
	top: 15px;
	right: 15px;
	font-size: 16px;
	vertical-align: middle;
}

/* --- Root --- */
ul, li {
	position: relative;
	display: inline-block;
}

.sitemapnav ul li:before,
.sitemapnav ul li:after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	border-color: #ddd;
	border-width: 1px;
	z-index: 0;
}

.sitemapnav ul li a { border-top-color: #e74c3c; width: auto; }
.sitemapnav ul li a:before, .sitemapnav ul li .fa { color: #e74c3c; }

/* --- Level 1 --- */
.sitemapnav ul ul {
	white-space: nowrap;
}

.sitemapnav ul ul li {
	position: relative;
	vertical-align: top;
	padding-top: 20px;
	margin-right: 20px;
	white-space: normal;
	width: 100%;
}

.sitemapnav ul ul li:last-child {
	padding-right: 0;
}

.sitemapnav ul ul li:before {
	border-top-style: solid;
	width: 30px;
	top: 50px;
	margin: 0 0 0 -30px;
}

.sitemapnav ul ul li:first-child:before {
	border-top-style: none;
	border-left-style: solid;
	width: 0;
	height: 30px;
	top: 0;
	left: 45px;
	margin: 0 0 0 -30px;
}

.sitemapnav ul ul li a { border-top-color: #3498db; width: auto; }
.sitemapnav ul ul li a:before, .sitemapnav ul ul li .fa { color: #3498db; }

/* --- Level 2 --- */
.sitemapnav ul ul ul {
	display: block;
	white-space: normal;
}

.sitemapnav ul ul ul li {
	display: block;
	position: relative;
	width: 100%;
	padding-left: 30px;
	margin-right: 0;
}

.sitemapnav ul ul ul li:before,
.sitemapnav ul ul ul li:first-child:before  {
	border-top-style: none;
	border-left-style: solid;
	height: 100%;
	top: 0;
	left: 45px;
}

.sitemapnav ul ul ul li:last-child:before  {
	height: 50px;
}

.sitemapnav ul ul ul li:after  {
	border-top-style: solid;
	top: 50px;
	left: 15px;
	width: 15px;
}

.sitemapnav ul ul ul li a { border-top-color: #2ecc71; width: auto; }
.sitemapnav ul ul ul li a:before, .sitemapnav ul ul ul li .fa { color: #2ecc71; }

/* --- Level 3 --- */
.sitemapnav ul ul ul ul li a { border-top-color: #e67e22; }
.sitemapnav ul ul ul ul li a:before, .sitemapnav ul ul ul ul li .fa { color: #e67e22; }

/* --- Level 4 --- */
.sitemapnav ul ul ul ul ul li a { border-top-color: #9b59b6; }
.sitemapnav ul ul ul ul ul li a:before, .sitemapnav ul ul ul ul ul li .fa { color: #9b59b6; }

/* --- Secondary --- */
.secondary {
	display: block;
	margin-top: 20px;
	padding-top: 20px;
	border-top: dotted 2px #eee;
}

.secondary ul {
	white-space: nowrap;
}

.secondary ul li {
	display: inline-block;
	white-space: normal;
	padding: 0 20px 0 0;
}

.secondary ul li:before,
.secondary ul li:after {
	display: none;
}

.secondary ul li:last-child {
	padding: 0;
}

.sitemapnav > ul > li > a,
.sitemapnav > ul > li > ul > li,
.secondary li a {
	width: 220px;
}
</style>

<div class="sitemap">

    <h1>My Sitemap</h1>
    <h2>Sitemap &mdash; Version 1.0</h2>
    <hr>

    <nav class="sitemapnav">
        <ul>
           <li id="home">
              <a href="https://mydomain.co.uk">
                  <i class="fa fa-home"></i> Home <small>Some kind of description</small>
              </a>
              <ul>
                 <li>
                    <a href="/search"><i class="fa fa-search"></i> Search <small>Search by name, location and/or category.</small></a>
                    <ul>
                       <li><a href="/search/#list">List view</a></li>
                       <li><a href="/search/#map">Map view</a></li>
                    </ul>
                 </li>
                 <li>
                    <a href="/suppliers"><i class="fa fa-building"></i> Suppliers</a>
                    <ul>
                       <li>
                           <a href="/suppliers/a-z">A to Z</a>
                           <ul>
                               <li><a href="/suppliers/a-z/:letter" class="multi">Level 3</a></li>
                           </ul>
                       </li>
                       <li>
                           <a href="/suppliers/location">Location</a>
                           <ul>
                               <li><a href="/suppliers/location/:location" class="multi">Level 3</a></li>
                           </ul>
                       </li>
                       <li>
                           <a href="/suppliers/category">Category</a>
                           <ul>
                               <li><a href="/suppliers/category/:category" class="multi">Level 3</a></li>
                               <li><a href="/suppliers/category/:category" class="multi">Level 4</a></li>
                           </ul>
                       </li>
                    </ul>
                 </li>
                 <li>
                    <a href="/supplier/:slug"><i class="fa fa-building"></i> Supplier <small>Supplier details page.</small></a>
                 </li>
                 <li>
                    <a href="/blog"><i class="fa fa-rss"></i> Blog <small>Filter by category or tag.</small></a>
                    <ul>
                       <li><a href="/blog/article" class="multi">Article</a></li>
                    </ul>
                 </li>
                 <li>
                    <a href="/about"><i class="fa fa-info-circle"></i> About</a>
                 </li>
                 <li>
                    <a href="/contact"><i class="fa fa-phone"></i> Contact</a>
                 </li>
              </ul>
           </li>
        </ul>
    </nav>

    <nav class="secondary">
        <ul>
           <li><a href="/login">Sign In</a></li>
           <li><a href="/sitemap">Site Map</a></li>
           <li><a href="/faqs">FAQs</a></li>
           <li><a href="/terms">Terms &amp; Conditions</a></li>
           <li><a href="/privacy">Privacy Policy</a></li>
        </ul>
    </nav>

</div>