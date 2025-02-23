w3m.vim
=======

Fork Note
---------
The original has not been updated for 8 years.
It's a very solid w3m wrapper for vim.

I've come to like the utility of an embedded vim browser.
But this implementation, as old as it is, is showing it's age.

I've done some basic improvements 

* moving the README into a help file
* implement (some) of the various bug fixes from other forks
* moved W3m buffer specific mappings/commands to ``<buffer>`` local commands
* some Markdown cleanup for this README
* fixes for search engine mappings
* added frogfind search, ``frog`` to compliment ``duck``. Frogfind specifically
reformats results for text based browser (using a port of mozilla's Readability
library).

I've also made some more specific changes for my tastes:

* limit word wrap to 80 characters for readability (with option to disable)
* Changes to the W3m command namespace, adopting Tim Popes ``:V`` ``:T``
convention. I've always found the finger combo of 1) shift-w followed by the
reach of 3 harder than it needs to be to type in a command.

Most of the rest of this doc is a cleaned up version of the original doc.

Description
-----------
w3m.vim is a plugin on vim for w3m that is a console web browser.

Requirements
------------
w3m.vim requires [w3m](http://w3m.sourceforge.net/) to be installed.

If w3m is not in your $PATH, you can specify its location in
your vimrc file.

    let g:w3m#command = 'C:\w3m.exe'

Usage
-----

### Open URL:

    input :W3m [url or keyword]

### Search Mode:

    input :W3m search-engine-name keyword

    [search-engine-name]
    alc              : space alc
    android          : Android SDK
    as3              : ActionScript 3.0
    go               : Go language
    google           : Google
    java             : JDK6
    man              : man
    msdn             : MSDN
    perl             : PERL
    php              : PHP
    python           : Python
    rfc              : RFC
    ruby             : Ruby
    wikipedia        : Wikipedia
    yahoo            : Yahoo
    yahoodict        : Yahoo dictionary
    local            : Local HTML file

### Open URL At New Tab

    input :W3mTab [url or keyword]

### Open URL At Split Window:

    input :W3mSplit [url or keyword]

### Open URL At Vertical Split Window:

    input :W3mVSplit [url or keyword]

### Open Local Html File

    input :W3m local html-file-path

## Buffer specific functions

This is the first change I've made to upstream
The (standard) practice of uniform command prefixes seems over strict when
applied to buffer local Commands, where the chance of overlap is small,
and the default is sensibly to the buffer local Command.
This make the commands considerably easier to type and more intuitive.

### Close:

    input :Close
    or
    input :bd

### Copy URL To Clipboard

    input :CopyUrl

### Reload Current Page

    input :Reload

### Change Url:

    input :AddressBar

### Show External Browser:

    input :ShowExtenalBrowser

### Syntax Off:

    input :SyntaxOff

### Syntax On:

    input :SyntaxOn

### Change User-Agent

    input :SetUserAgent (w3m|Chrome|Firefox|IE6|IE7|IE8|IE9|Opera|Android|iOS|KDDI|DoCoMo|SoftBank)

### Open from history:

    input :History

### Clear history:

    input :HistoryClear

Settings
--------

### Highlight:

    highlight! link w3mLink      Function
    highlight! link w3mLinkHover SpecialKey
    highlight! link w3mSubmit    Special
    highlight! link w3mInput     String
    highlight! link w3mBold      Comment
    highlight! link w3mUnderline Underlined
    highlight! link w3mHitAHint  Question
    highlight! link w3mAnchor    Label

### Use Proxy:

    let &HTTP_PROXY='http://xxx.xxx/:8080'

### Set External Browser:

    let g:w3m#external_browser = 'chrome'

### Set Home Page
    
    let g:w3m#homepage = "http://www.google.co.jp/"

### Specify Key Of Hit-A-Hint

    let g:w3m#hit_a_hint_key = 'f'

### Specify Default Search Engine:

    let g:w3m#search_engine = 
        \ 'http://search.yahoo.co.jp/search?search.x=1&fr=top_ga1_sa_124&tid=top_ga1_sa_124&ei=' . &encoding . '&aq=&oq=&p='

### Disable Default Keymap

You set as follows if you do not want to use default keymap.

    let g:w3m#disable_default_keymap = 1

### Disable Vimproc

You set as follows if you do not want to use vimproc.

    let g:w3m#disable_vimproc = 1

### Toggle Link Hovering

By default links under the curosr are highlighted. Turn off with one of the following

    unlet g:w3m#set_hover_on
    let g:w3m#hover_set_on = -1 
    " a value less than or equal to 0 will turn it off

    " set delay time until highlighting
    let g:w3m#hover_delay_time = 100

### Search Engine Localization

Search engines are loaded from `autoload/w3m/search_engines/YOUR_LOCALE/`, and then from the "global" locale
unless a localized search engine of the same name exists. Your locale defaults to `v:lang`, which vim sets
based on your `$LANG` environment variable.`

To specify a custom locale for loading search engines:

    let g:w3m#lang = 'en_US'


### Specify path to history file

    let g:w3m#history#save_file = $HOME.'/.vim_w3m_hist'

### Disable 80 column limit for line wrap

    let g:w3m#allow_long_lines = 1

Default Keymaps
---------------
* &lt;CR&gt;      Open link under the cursor.
* &lt;S-CR&gt;    Open link under the cursor (with new tab).
* &lt;TAB&gt;     Move cursor next link.
* &lt;s-TAB&gt;   Move cursor previous link.
* &lt;Space&gt;   Scroll down.
* &lt;S-Space&gt; Scroll up.
* &lt;BS&gt;      Back page.
* &lt;A-LEFT&gt;  Back page.
* &lt;A-RIGHT&gt; Forward page.
* =         Show href under the cursor.
* f         Hit-A-Hint.
* s         Toggle Syntax On/Off.
* c         Toggle Cookie On/Off.
* &lt;M-D&gt;     Edit current url.

ScreenShots
-----------

### Sample Image1
![sample1](http://yuratomo.up.seesaa.net/image/w3mvim_v0.4.0.001.png "sample1")

### Hit-A-Hint
![sample1](http://yuratomo.up.seesaa.net/image/w3mvim_v0.4.0.002.png "sample1")

HISTORY
-------

Forked from https://github.com/yuratomo/w3m.vim
