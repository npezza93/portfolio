Archipelago is an open-source terminal emulator built on [Electron](https://electronjs.org/), [JavaScript](https://www.ecma-international.org/publications/standards/Ecma-262.htm), [React](https://reactjs.org/), and utilizes [Xterm.js](https://github.com/xtermjs/xterm.js). Archipelago also has an accompanying Atom package so you can open a terminal inside your development environment.

I'm a fan of web technologies, so I started using
[Hyper](https://github.com/zeit/hyper) as my default terminal while it was in beta.
Hyper was by far the coolest, best looking, and extensible terminal emulator I had used and being an Electron app, it was cross-platform.

But, I found Hyper(beta and version 1) to be extremely slow, to the point that if I was going to run a command that I knew would have a lot of output, I would opt for using the OS default. Along with that, occasionally buffers would overlap making the terminal unreadable and force me to restart the terminal.

After using Hyper for a while and then finding the [Xterm.js](https://xtermjs.org/) project(Hyper was using [Hterm](https://github.com/chromium/hterm) at this point, it has since switched to Xterm.js as of v2), I thought perhaps I can make a terminal that performs faster than Hyper. So that's what Archipelago is, my perfect terminal, fast, pretty, extensible, and stable.


Desktop app - [GitHub](http://www.github.com/npezza93/archipelago)

Atom package - [Atom.io](https://atom.io/packages/archipelago)
