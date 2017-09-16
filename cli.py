import os
import click


# Dynamically Load Commands.
plugin_folder = os.path.abspath(os.path.join(os.path.dirname(__file__), 'commands'))


class ScriptCLI(click.MultiCommand):

    def list_commands(self, ctx):
        rv = []
        for filename in os.listdir(plugin_folder):
            if filename.endswith('.py'):
                rv.append(filename[:-3])
        rv.sort()
        return rv

    def get_command(self, ctx, name):
        ns = {}
        fn = os.path.join(plugin_folder, name + '.py')
        with open(fn) as f:
            code = compile(f.read(), fn, 'exec')
            eval(code, ns, ns)
        return ns['cli']


# Execute Command Line Interface.
cli = ScriptCLI()


if __name__ == '__main__':
    cli()
