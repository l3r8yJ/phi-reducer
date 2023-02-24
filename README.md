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


### How to contribute
```shell
coq_makefile -f _CoqProject -o CoqMakefile
```
