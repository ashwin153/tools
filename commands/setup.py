import subprocess
import os
import click


@click.group()
def cli():
    pass


@cli.command()
@click.option('--type', type=click.Choice(['cpp', 'latex', 'pants']), help='Project type.')
@click.option('--root', default='./', help='Project root directory.')        
def project(type, root):
    path = '~/Documents/workspace/tools/assets/setup/%s/' % type
    subprocess.call('cp -r %s %s' % (path, root), shell=True)

