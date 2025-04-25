#!/usr/bin/env python3
import re
import subprocess
import sys

# Command to invoke the local PlantUML CLI (must be on PATH)
PLANTUML_CMD = ["plantuml", "-tsvg", "-pipe", "-nometadata"]

# Regex to match ```plantuml ... ``` blocks
_PAT = re.compile(
    r"```plantuml[ \t]*\n(.*?)\n```",
    re.DOTALL | re.MULTILINE
)


def _strip_xml_declaration(svg_text: str) -> str:
    """
    Remove leading XML declaration if present from the SVG text.

    :param svg_text: Full SVG output from PlantUML CLI
    :return: SVG text without the XML declaration
    """
    return re.sub(r'^<\?xml[^>]*\?>\s*', '', svg_text)


def _render_svg(uml_source: str) -> str:
    """
    Run the PlantUML CLI on the given UML source (via stdin) and return
    the generated SVG text (without XML declaration). Raises if CLI fails.
    """
    proc = subprocess.Popen(
        PLANTUML_CMD,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    svg_bytes, err = proc.communicate(uml_source.encode("utf-8"))
    if proc.returncode != 0:
        sys.stderr.write(f"[preprocess_plantuml] PlantUML error: {err.decode()}\n")
        raise RuntimeError("PlantUML CLI failed")

    svg_text = svg_bytes.decode("utf-8")
    return _strip_xml_declaration(svg_text)


def _replace_block(match: re.Match) -> str:
    """
    Callback for re.sub: replaces the UML fenced block with its SVG.
    """
    uml = match.group(1)
    try:
        return _render_svg(uml)
    except Exception:
        return match.group(0)


def preprocess(markdown_content: str) -> str:
    """
    Called by MkSlides. Replaces every ```plantuml ... ``` block with
    the rendered SVG (XML declaration removed) from the local PlantUML CLI.
    """
    return _PAT.sub(_replace_block, markdown_content)
