#lang scribble/base

@(require scribble/manual scribble/core racket/list json)
@(define (code . pre-content) (elem (apply literal pre-content) #:style 'tt))

@title{BreezeWiki Documentation}

@url{https://breezewiki.com}

@local-table-of-contents[]

@; -----------------------------------------------------------------------------

@section{Links}

@subsection{Official}

@tabular[#:style (style "user-table" null)
         (map (λ (row) (list (first row) (if (string? (second row)) (url (second row)) (second row))))
              `(("Official website" "https://breezewiki.com")
                ("Community" "https://matrix.to/#/#breezewiki:cadence.moe")
                ("How to bug report or feature request" ,(Secref "Reporting Bugs"))
                ("Planned features" "https://todo.sr.ht/~cadence/breezewiki-todo")
                ("Source code" "https://gitdab.com/cadence/breezewiki")
                ("Documentation source" "https://gitdab.com/cadence/breezewiki-docs")
                ))]

@subsection{Mirrors}

@tabular[#:style (style "user-table instance-list user-table--title" null)
         `((,(literal "Hoster") ,(literal "Link"))
            ,@(for/list ([item (with-input-from-file "files/instances.json" (lambda () (read-json)))])
                (define-values (owner-name owner-website instance)
                               (apply values (for/list ([key '(owner_name owner_website instance)])
                                               (hash-ref item key))))
                (list (if (string? owner-website) (hyperlink owner-website owner-name) owner-name)
                      (url instance))))]

@hyperlink["https://docs.breezewiki.com/files/instances.json" "Machine-readable data"]

@; -----------------------------------------------------------------------------

@section{Automatic Redirection}

If you'd like to be automatically redirected from fandom.com to breezewiki.com, follow @italic{one} of the methods below.

@hyperlink["https://buddyfight.fandom.com/wiki/It_Doesn%27t_Work!!?b=" "Test whether you're currently being redirected!"]

@subsection{Browser extension: Indie Wiki Buddy}
@nested[#:style (style "recommended-tool" null)]{

@bold{This is easiest to use!} It works in Firefox and Chrome on the computer.

@itemlist[#:style 'ordered
@item{Install the extension: @hyperlink["https://addons.mozilla.org/en-US/firefox/addon/indie-wiki-buddy/" "Firefox"] or @hyperlink["https://chrome.google.com/webstore/detail/indie-wiki-buddy/fkagelmloambgokoeokbpihmgpkbgbfm" "Chrome"]}
@item{Click its icon and check "BreezeWiki is on" at the top.}
]

@bold{There you go, all done!} If it works, you can stop reading here.
}

@subsection{Browser extension: Redirector}

This will redirect you with no fanfare. It works in Firefox and Chrome on the computer.

@itemlist[#:style 'ordered
@item{Install the extension: @hyperlink["https://addons.mozilla.org/en-GB/firefox/addon/redirector/" "Firefox"] or @hyperlink["https://chrome.google.com/webstore/detail/redirector/ocgpenflpmgnfapjedencafcfakcekcd" "Chrome"]}
@item{Download this file: @url{https://docs.breezewiki.com/files/breezewiki-redirector.json}}
@item{Click on the Redirector extension icon, click @italic{Edit Redirects}, click @italic{Import}, then choose the @italic{breezewiki-redirector.json} file you just downloaded. It will say successfully imported.}
@item{Once it's imported, you can delete the @italic{breezewiki-redirector.json} file from your computer.}
]

@subsection{Browser extension: Violentmonkey}

@nested[#:style (style "block-note" null)]{Violentmonkey executes @italic{userscripts} created by other people, which can do many things to your web browser, more than just redirect you. Some may be helpful, some may be harmful. Make sure you only install userscripts that you trust.

Userscripts from this page are known to be trustworthy :)}

Violentmonkey works in all web browsers on the computer.

@itemlist[#:style 'ordered
@item{@hyperlink["https://violentmonkey.github.io/get-it/" "Install the extension"] (or you can choose another userscript manager, like Greasemonkey or Tampermonkey)}
@item{@hyperlink["http://alphamethyl.barr0w.net/~barrow/src/barrownet_ca_redirector/breezewiki_redirector.user.js" "Install Barrow's userscript"], which will automatically send you to BreezeWiki. Alternatively, @hyperlink["https://docs.breezewiki.com/files/redirector.user.js" "Install Cadence's userscript"], which will show a big banner you can click to take you to BreezeWiki.}
@item{Violentmonkey will show you the code of the userscript, and offer to install it for you. If you want to proceed with the installation, click @italic{Confirm Installation}.}
]

@subsection{Browser extension: LibRedirect}

LibRedirect is ideal if you're a privacy-minded Firefox user. It can redirect many popular websites such as YouTube, Reddit, Google Maps and Twitter to alternative viewers; you can configure which sites will be redirected.

@itemlist[#:style 'ordered
@item{@hyperlink["https://libredirect.codeberg.page/download.html" "Install LibRedirect."]}
@item{Open LibRedirect's settings and check which websites will be redirected.}
]

@; -----------------------------------------------------------------------------

@section[#:tag "Reporting Bugs"]{Reporting Bugs}

Bug reports are important, and so are feature requests! Thank you for your interest. Here's how to send in yours.

There is the @italic{mailing list} which is the first line for people like you to report to. Once a bug is confirmed, I will copy it onto the @italic{todo tracker} as a task item.

Please spend one minute @hyperlink["https://todo.sr.ht/~cadence/breezewiki-todo" "checking the todo tracker"] so you don't submit a duplicate of somebody else's report.

You can interact with the mailing list and the todo tracker without needing to register any accounts on any websites! It's all done through regular email.

@subsection{Actually sending a report}

To actually send in your report, compose an email to @hyperlink["mailto:~cadence/breezewiki-discuss@lists.sr.ht" "~cadence/breezewiki-discuss@lists.sr.ht"] with a useful subject line and a description.

Please make sure to include the following information:

@itemlist[
@item{Which URL can I visit to see it for myself?}
@item{Which part of the page are you talking about?}
@item{Does it happen every time?}
]

Thanks!

@subsection{Other communication channels}

For real-time chat with the community, @hyperlink["https://matrix.to/#/#breezewiki:cadence.moe" "check out our chatroom!"]

To privately contact Cadence, the developer of BreezeWiki, @hyperlink["https://cadence.moe/contact" "here's their website with contact info."] If you run a wiki on Fandom or any other website, you're very welcome to send me a message! If you don't run any wikis, you're a normal amount of welcome :D

@; -----------------------------------------------------------------------------

@section{Running}

@subsection{Running a compiled executable}

This method is recommended for people who do not want to edit the source code.

The distribution includes the Racket runtime, libraries, and everything else needed to run BreezeWiki.

@itemlist[#:style 'ordered
@item{Download the distribution: @url{https://docs.breezewiki.com/files/breezewiki-dist.tar.gz}}
@item{Unpack the archive.}
@item{Execute the binary @code{breezewiki-dist/bin/dist}.}
]

@subsection{Running the source code}

This method is recommended for people who want to edit the source code, or for people who can't use the compiled distribution.

@itemlist[#:style 'ordered
@item{Install Racket. Please install the latest version. 8.4 or later is required. @hyperlink["https://download.racket-lang.org/" "Download it here if your package manager is old."]}
@item{Clone the repository from @url{https://gitdab.com/cadence/breezewiki}.}
@item{Run @code{raco pkg install --auto req} to install the @code{raco req} command.}
@item{Run @code{raco req -d} in the repository to install dependencies.}
]

Now you can start BreezeWiki using one of the following methods.

@itemlist[
@item{Run @code{racket dist.rkt} to start BreezeWiki.}
@item{Evaluate @code{breezewiki.rkt} in DrRacket or in the Racket REPL to start BreezeWiki with module hot-reloading. Helpful for development!}
]

To be able to start up BreezeWiki faster, use @code{raco make dist.rkt} to byte-compile individual files.

@nested[#:style (style "block-note" null)]{If building in an automated environment, like CI or Docker, use @code{raco pkg install --batch --auto --no-docs --skip-installed req-lib} instead of step 3 above.}

@subsection{Updating the source code}

If you are running BreezeWiki from source code, you will need to follow these steps any time you pull the latest version. (Not required when running the executable or Docker.)

@itemlist[#:style 'ordered
@item{Make sure your version of Racket is still new enough to run BreezeWiki. The required version is listed above.}
@item{Run @code{raco pkg update --all} to update existing dependencies.}
@item{Run @code{raco req -d} to install any new dependencies.}
]

@subsection{Running with Docker}

@nested[#:style (style "block-note" null)]{There is no official Docker support. Information herein is created by members of the community. Using Docker makes it more difficult to debug and find help if you encounter problems.}

Image provided by PussTheCat.org: @url{https://github.com/PussTheCat-org/docker-breezewiki-quay}

@subsection{Resource usage}

A full clone of BreezeWiki uses less than 10 MB of space on disk.

RAM usage is typically 400-500 MB.

CPU usage is difficult to specify, and depends on how frequently it sees incoming requests. When not servicing requests, it shouldn't be using any processing power.

@subsection{What next?}

If you're running BreezeWiki in production (i.e. not for development) then check out the @secref["Required options"] section of the configuration page.

@; -----------------------------------------------------------------------------

@section[#:tag "Configuration"]{Configuration}

Please set up your configuration file. You must restart BreezeWiki for it to take effect.

@subsection{File}

Configuration options are added to the @code{config.ini} file. It is a regular INI file. When running from source, @code{config.ini} goes next to @code{breezewiki.rkt} in the root directory of the repo.

If you do not specify a specific option, the internal default will be used. If the file is missing or empty, all defaults will be used.

When running a compiled distribution of BreezeWiki, the main @code{config.ini} file will actually be a symlink to the real location of the file. Make sure not to erase the symlink, or your settings will be ignored!

@subsubsection{Example}

Here is an example configuration file. It shows all the available settings and all their defaults.
@verbatim{
bind_host = auto
port = 10416
canonical_origin =
debug = false
feature_search_suggestions = true
log_outgoing = true
strict_proxy = true
}

@subsubsection{Format}

@itemlist[
@item{A line with an equals sign @code{=} defines one setting.}
@item{The text before the equals sign is the @italic{key}.}
@item{The text after the equals sign is the @italic{value}. It may be empty.}
@item{Quote marks are optional - they are never necessary.}
@item{Spacing around the equals sign is optional.}
@item{@italic{False} values are represented by either empty space, or the text @code{false}. Anything else is @italic{True}.}
]

@subsection{Environment variables}

By popular demand, environment variables can be used as an alternative to the configuration file. The configuration file will be read first and will override the default settings, then, if any environment variables are present, they will override the values in the configuration files.

Environment variables start with @code{bw_} and then the name of the setting. They can be uppercase or lowercase.

@subsubsection{Example}

Here is an example of using environment variables in a typical shell:

@verbatim{
bw_port=4000 bw_debug=false racket dist.rkt
}

@subsection[#:tag "Required options"]{Required options}

No options are strictly required, but some are highly recommended, depending on where you're running BreezeWiki.

When running for local development, @code{debug = true} is recommended.

When running in production, @code{canonical_origin} is highly recommended.

@subsection{Detailed Options}

@defthing[bind_host value #:value "auto"]{
Which hostname to run the server on. The default value is auto. Auto means 127.0.0.1 in debug mode, otherwise, all interfaces. If you don't know what this means, don't change it.
}

@defthing[port value #:value "10416"]{
Which port to run the server on.
}

@defthing[canonical_origin value #:value ""]{
The primary URL where people can access the homepage of your instance.

For example, @code{https://breezewiki.com}
}

@defthing[debug boolean #:value "false"]{
Enables debugging mode, for debugging BreezeWiki during development.

Enables more runtime checks and more verbose output. Turns off some browser caching.
}

@defthing[feature_search_suggestions boolean #:value "true"]{
Enables the search suggestions feature.

When enabled, any text typed in the search box will be sent to Fandom servers in order to provide suggestions. It will be sent via the proxy if the strict_proxy option is set.
}

@defthing[log_outgoing boolean #:value "true"]{
Whether to log outgoing requests to Fandom to the console.
}

@defthing[strict_proxy boolean #:value "true"]{
Whether to put more URLs through the proxy. If false, just a minimal set is proxied. If true, additionally proxies page stylesheets and links to image files, thereby reducing the potential for end-users to connect to Fandom servers.
}

@; -----------------------------------------------------------------------------

@section{Developing BreezeWiki}

@subsection{Racket}

BreezeWiki is programmed in the @hyperlink["https://racket-lang.org" "Racket"] programming language.

If you are new to programming entirely, BreezeWiki is likely not a good introductory project for you. I recommend purchasing a physical book about programming targeted at beginners. (In 2022, internet searches for beginner programming questions are sadly filled with low quality results or straight up misinformation.)

If you already know programming concepts but are new to Racket, I recommend reading @hyperlink["https://docs.racket-lang.org/quick/" "Quick: An Introduction to Racket with Pictures"] and trying the instructions for yourself. This should fill you in on the basics of doing real things with the Racket language. After reading that, if you want to know the fundamentals even more in-depth, you can check out the @hyperlink["https://docs.racket-lang.org/guide/index.html" "Racket Guide"], which is better to jump around in rather than read from start to end. The Racket reference documentation is on the same website.

I @italic{recommend} using the official DrRacket IDE to write Racket code, particularly if you are a beginner. It applies useful indentation automatically and it has helpful hover hints. Once you are familiar with Racket, you could configure Emacs, VSCode, Vim, or your favourite other editor to understand Racket's style rules, though you might still miss out on syntax highlighting or hover hints in some situations.

@subsection{Files}

@code{breezewiki.rkt} and @code{dist.rkt} are entrypoints. They do as little as possible, just requiring the page functions and starting the web server.

@code{src/page-*.rkt} contains the page functions. Each file has instructions on how to render a specific kind of page. For example, @code{src/page-wiki.rkt} renders the usual wiki pages by contacting Fandom servers, altering the HTML tree, and sending the response to the browser.

Everything else in @code{src/} is a utility file that is required in by the pages as needed.

@subsection{Fandom endpoints}

BreezeWiki mostly uses the MediaWiki APIs rather than scraping full pages pages. If I need to add functionality in the future that can't be covered through the APIs, I would consider changing to scraping full pages.

@subsection{HTML tree transformations}

@hyperlink["https://www.mediawiki.org/wiki/API:Parsing_wikitext" "MediaWiki's Parse API"] returns the contents of a page as HTML, but returning this wholesale isn't good enough. Several modifications need to be made to the page before it's suitable for display on BreezeWiki, such as altering links to have the correct prefix, making all images visible without JavaScript, and enclosing tables to allow horizontal scrolling.

To do these transformations, the @code{update-tree} function recurses through the whole HTML tree from MediaWiki, executing a function on each element. This function returns the new element to replace with, allowing update-tree to eventually build a whole brand new tree. If the function decides that there's nothing to be done for a particular element, it just returns the same element. You can see the largest example of this in @code{src/page-wiki.rkt}, where many transformations can be applied to every element.

Background: Racket is a dialect of Lisp, a class of programming languages that are good at manipulating lists of symbols. XML and HTML trees are represented as @italic{X-expressions}, which you can read a bit more about within the @hyperlink["https://docs.racket-lang.org/pollen/second-tutorial.html#%28part._.X-expressions%29" "Pollen documentation: X-expressions"]. (The rest of the Pollen documentation is unrelated.) An X-expression is often called an xexp or an xexpr for short. BreezeWiki includes @code{src/xexpr-utils.rkt} for some helpful functions that query and manipulate X-expressions.

@subsection{Programming}

If @code{breezewiki.rkt} is launched (in a REPL) it will dynamically load in the pages and watch them and their dependencies for changes. If you edit and save a file within @code{src/} it will likely be reloaded automatically.

Creating a new page requires editing @code{src/dispatcher-tree.rkt} to define which URLs the page should appear from, and @code{breezewiki.rkt} and @code{dist.rkt} to cause the page to actually be loaded. The first time you create a page it won't be loaded automatically and you'll need to restart BreezeWiki.

Automatic reloading helps with rapid development and avoiding long process startup times. But if the long startup times still frustrate you, you can use @code{raco make breezewiki.rkt dist.rkt} to byte-compile files for faster startup.

@subsection{Testing}

Most files also contain unit tests, within the @code["(module+ test"] sections. Evaluating a file within either DrRacket or Emacs-racket-mode automatically runs the tests in that file. Since almost all functions are pure functions (i.e. operate based on their inputs and outputs rather than relying on application state) they are easy to unit test.

You can run all tests in all files with @code["raco test --direct (grep -l 'module+ test' (git ls-files))"] which is helpful to check for regressions before committing.
