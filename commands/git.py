import subprocess
import click


@click.group()
def cli():
    pass


@cli.command()
@click.option('--base', default='master', help='Branch to merge into.')
@click.option('--feature', help='Branch to merge from.')
def merge(base, feature):
    subprocess.call('git checkout %s' % feature, shell=True)
    subprocess.call('git pull', shell=True)
    subprocess.call('git checkout %s' % base, shell=True)
    subprocess.call('git pull', shell=True)
    subprocess.call('git merge --no-ff --no-commit %s' % feature, shell=True)


@cli.command()
@click.argument('branch')
@click.option('--remote', is_flag=True, help="Propagate deletion to remote")
def delete(branch, remote):
    if remote:
        subprocess.call('git push origin --delete %s' % branch, shell=True)
    subprocess.call('git branch -D %s' % branch, shell=True)

