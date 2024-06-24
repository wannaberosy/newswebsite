import os
import sys

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "news.settings")
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Django模块异常或确实相应模块，请检查！"
        ) from exc
    execute_from_command_line(sys.argv)
