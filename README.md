[![tests](https://github.com/ddev/ddev-addon-template/actions/workflows/tests.yml/badge.svg)](https://github.com/ddev/ddev-addon-template/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2024.svg)

# ddev-sshd <!-- omit in toc -->

For now, I won't be providing releases, please install with 

```
ddev get https://github.com/hanoii/ddev-sshd/tarball/main
```

This adds an ssh server to the container. If `ddev auth ssh` has previously been
run, it will export your local keys as authorized keys so you can ssh into the 
container.

The exposed host port will change on each restart, you can look for it on
`ddev describe`.

This addon comes with a `ddev sshd:config` command that modify your local ssh
configuration so that you can `ssh DDEV_PROJECT` making easier to work with ssh.

You can test this command and if you are happy with what it does you can add it 
to a post-start hook on your `config.yaml`:

```yaml
hooks:
  post-start:
    - exec-host: ddev sshd:config
```

If you are courious on what the command will add, try

```
ddev sshd:config --dry-run
```

**Contributed and maintained by [@hanoii](https://github.com/hanoii)**
