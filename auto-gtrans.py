"""Auto google translator for Factorio locale files

Requires python!=3.13, googletrans=3.1.0a0, and regex module"""

import os
import googletrans as gt
import regex as re
import argparse


LFNAME = "Mod-Locale-1.cfg"


def main(args):

    pattern = r"(?P<prefix>[a-zA-Z0-9\-]+=)(?P<text>.+)"
    r = re.compile(pattern)

    # Open translator
    trans = gt.Translator()

    # Make sure new locale files exist and will be overwritten
    lfs = {}
    for lc in args.locale:
        try:
            os.mkdir(os.path.join("locale", lc))
        except FileExistsError:
            pass

        lfs[lc] = open(os.path.join("locale", lc, LFNAME), "w+", encoding="utf8")

    # Get raw data
    with open(args.input, "r") as rf:
        # Process each line
        for line in rf:
            results = r.match(line)
            if results is None:
                for wf in lfs.values():
                    wf.write(line + "\n")
                continue

            print(results.group("text"))

            for lc, wf in lfs.items():
                out = trans.translate(results.group("text"), dest=lc)
                wf.write(results.group("prefix") + out.text + "\n")


if __name__ == "__main__":
    import argparse

    def dir_path(path):
        if os.path.isdir(path):
            return path
        else:
            raise argparse.ArgumentTypeError(f"readable_dir:{path} is not a valid path")

    def file_path(path):
        if os.path.isfile(path):
            return path
        else:
            raise argparse.ArgumentTypeError(f"readable_dir:{path} is not a valid path")

    def test_locales(locale):
        if not gt.LANGUAGES.get(locale):
            raise argparse.ArgumentTypeError(
                f"locale: {locale} is not a valid locale code"
            )
        if locale == "en":
            raise argparse.ArgumentTypeError(
                f"locale: {locale} is not a valid locale code for this script"
            )
        return locale

    parser = argparse.ArgumentParser(description="Auto translate locale file")
    parser.add_argument(
        "-i",
        "--input",
        type=file_path,
        default=os.path.join("locale", "en", LFNAME),
        help="Input locale file to parse",
    )
    parser.add_argument("locale", type=test_locales, nargs="+", help="locales to parse")

    args = parser.parse_args()

    main(args)
