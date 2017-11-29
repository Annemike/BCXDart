# DARTFSD

## Clone

```bash
cd ~
git clone --recursive https://github.com/EpicMinister/DARTFSD.git
```

## Install and launch

1. Go into your /DARTFSD folder and run
2. Setup or launch your workspace

### Setup Workspace

```bash
./setup.sh
```

### Build and launch

```bash
./launch.sh
```
## Working on this Repo
1. Every module has its own branch to work on. The name convention is: <modulename>.
   Additional every module has its own metapackage. In this package you have all your packages you need. All metapackages are created before.
2. On your branch you can do whatever you want. The only thing is that it works. 
3. Merging to the master is only allowed if you pull the latest master and your branch compiles on CI.
