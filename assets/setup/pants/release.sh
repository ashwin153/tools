#!/bin/bash
declare -a targets=()

declare -a artifacts=()

# Verify Branch is Clean.
branch=$(git symbolic-ref --short HEAD)
if [ -n "$(git status --porcelain)" ]; then 
  echo -e "Current branch \033[0;33m$branch\033[0m has uncommitted changes."
  exit 1
fi

# Release Guidelines: https://github.com/ashwin153/caustic/wiki/Release
read -p "Artifact version (defaults to incrementing patch version): " version
read -r -p "$(echo -e -n "Confirm release of \033[0;33m$branch\033[0;0m? [y|N] ")" response

# Publish Build Artifacts.
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]] ; then
  if [ -z "$version" ] ; then
    # Increment Patch Version.
    publish="./pants publish.jar --publish-jar-no-dryrun ${targets[@]}"
  else
    # Override Artifact Version.
    overrides=("${artifacts[@]/#/--publish-jar-override=com.madavan#}")
    overrides=("${overrides[@]/%/=$version}")
    publish="./pants publish.jar --publish-jar-no-dryrun ${overrides[@]} ${targets[@]}"
  fi

  if eval $publish ; then 
    # Promote to Maven Central.
    /usr/bin/open -a "/Applications/Google Chrome.app" \
      'http://www.pantsbuild.org/release_jvm.html#promoting-to-maven-central'
    /usr/bin/open -a "/Applications/Google Chrome.app" \
      'https://oss.sonatype.org/#stagingRepositories'
  fi
fi
