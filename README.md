1.Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.

git show aefea
commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545
    Update CHANGELOG.md

2.Какому тегу соответствует коммит 85024d3?

git show 85024d3
commit 85024d3100126de36331c6982bfaac02cdab9e76 (tag: v0.12.23)

3.Сколько родителей у коммита b8d720? Напишите их хеши.

двое родителей. Их хэши 56cd7859e и 9ea88f22f

git log b8d720 --graph
*commit b8d720f8340221f2146e4e4870bf2ee0bc48f2d5
|\  Merge: 56cd7859e 9ea88f22f

4.Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24.

git log v0.12.23...v0.12.24 --oneline
33ff1c03b (tag: v0.12.24) v0.12.24
b14b74c49 [Website] vmc provider links
3f235065b Update CHANGELOG.md
6ae64e247 registry: Fix panic when server is unreachable
5c619ca1b website: Remove links to the getting started guide's old location
06275647e Update CHANGELOG.md
d5f9411f5 command: Fix bug when using terraform login on Windows
4b6d06cc5 Update CHANGELOG.md
dd01a3507 Update CHANGELOG.md
225466bc3 Cleanup after v0.12.23 release

5.Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточего перечислены аргументы).

git log -S 'func providerSource' --oneline
8c928e835 main: Consult local directories as potential mirrors of providers

git show 8c928e835
+func providerSource(services *disco.Disco) getproviders.Source {

6.Найдите все коммиты в которых была изменена функция globalPluginDirs.

git log -S 'globalPluginDirs' --oneline

git show 8364383c3

diff --git a/plugins.go b/plugins.go
new file mode 100644
index 000000000..9717724a0
--- /dev/null
+++ b/plugins.go
@@ -0,0 +1,37 @@
+package main
+
+import (
+       "log"
+       "path/filepath"
+
+      "github.com/kardianos/osext"
+)
+
+// globalPluginDirs returns directories that should be searched for

git log -L globalPluginDirs:plugins.go

78b12205587fe839f10d946ea3fdc06719decb05
52dbf94834cb970b510f2fba853a5b49ad9b1a46
41ab0aef7a0fe030e84018973a64135b11abcd70
66ebff90cdfaa6938f26f908c7ebad8d547fea17
8364383c359a6b738a436d1b7745ccdce178df47

7.Кто автор функции synchronizedWriters?

Author: Martin Atkins

git log -S 'synchronizedWriters' --oneline
git show 5ac311e2a


diff --git a/synchronized_writers.go b/synchronized_writers.go
new file mode 100644
index 000000000..2533d1316
--- /dev/null
+++ b/synchronized_writers.go
@@ -0,0 +1,31 @@
+package main
+
+import (
+       "io"
+       "sync"
+)
+
+type synchronizedWriter struct {
+       io.Writer
+       mutex *sync.Mutex
+}
+
+// synchronizedWriters takes a set of writers and returns wrappers that ensure
+// that only one write can be outstanding at a time across the whole set.
+func synchronizedWriters(targets ...io.Writer) []io.Writer {



