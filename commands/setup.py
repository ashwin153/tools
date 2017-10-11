import subprocess
import os
import click


@click.group()
def cli():
    pass


@cli.command()
def upgrade():
    subprocess.call('git -C ~/Documents/workspace/tools pull', shell=True)
    subprocess.call('chmod +x ~/Documents/workspace/tools/install.sh', shell=True)
    subprocess.call('~/Documents/workspace/tools/install.sh', shell=True)


@cli.command()
@click.option('--type', type=click.Choice(['cpp', 'latex', 'pants']), help='Project type.')
@click.option('--root', default='./', type=click.Path(exists=True), help='Project root directory.')        
def project(type, root):
    path = '~/Documents/workspace/tools/assets/setup/%s/' % type
    subprocess.call('cp -r %s %s' % (path, root), shell=True)

