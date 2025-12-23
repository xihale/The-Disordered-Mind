# The Disordered Mind

A high-quality Markdown source and build system for the Chinese edition of **"The Disordered Mind: What Unusual Brains Tell Us About Ourselves"** by Eric Kandel.

## Overview

This repository contains the complete Markdown source of the book, optimized for conversion into professional digital formats (PDF, EPUB, and HTML) using Pandoc.

## Prerequisites

To build the project, you need the following tools installed:

- **Pandoc**: The universal document converter.
- **XeLaTeX**: Required for PDF generation with CJK support.
- **LXGW WenKai Font**: The default font used for Chinese typesetting.

## Build Instructions

Use the provided `Makefile` to generate the desired formats:

```bash
# Generate all formats (PDF, HTML, EPUB)
make all

# Generate specific formats
make pdf
make epub
make html

# Clean up build artifacts
make clean
```

Outputs will be generated in the `dist/` directory.
