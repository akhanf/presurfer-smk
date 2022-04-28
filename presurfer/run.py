#!/usr/bin/env python3
import os

from snakebids.app import SnakeBidsApp


def main():
    app = SnakeBidsApp(
        os.path.abspath(os.path.dirname(__file__)),
        configfile_path="config/snakebids.yml",
    ).run_snakemake()


if __name__ == "__main__":
    main()
