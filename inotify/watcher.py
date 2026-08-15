from inotify_simple import INotify,flags

inotify=INotify()
watch_flags= flags.DELETE | flags.CREATE | flags.MODIFY | flags.DELETE_SELF

watch=inotify.add_watch("./test_dir/",watch_flags)

while True:
    for event in inotify.read():
        print(event)
        for flag in flags.from_mask(event.mask):
            print('    '+flags(flag).name)
