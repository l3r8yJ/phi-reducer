# Phi-reducer
[<img src="docs/imgs/phi-reducer.png" width="200"/>](https://www.l3r8y.ru/phi-reducer/)

This is an experimental project.

Here's a [phi-calculus](https://arxiv.org/abs/2111.13384) expression:

`[ y -> [ z -> 42 ].z ].y`

It may be reduced to:

`[ z -> 42 ].z`

And then:

`42`

This project analyzes the phi-calculus expressions and reduces them if it's possible

### - TBD

if you want to try to play with it, do [this](https://www.l3r8y.ru/2023/02/24/how-to-coq) before getting started

### How to contribute
Build pdf and latex, do it carefully, Makefile is still not very good.
```shell
make
```
Removes pdf, latex
```shell
make clean
```
