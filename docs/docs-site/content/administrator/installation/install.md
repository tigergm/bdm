---
title: "Install"
date: 2019-03-13T18:28:08-07:00
draft: false
weight: 2
---

Configure `$PREFIX` with the path where you want to install Hue by running:

    PREFIX=/usr/share make install
    cd /usr/share/hue

You can install Hue anywhere on your system, and run Hue as a non-root user.

It is a good practice to create a new user for Hue and either install Hue in
that user's home directory, or in a directory within `/usr/share`.
