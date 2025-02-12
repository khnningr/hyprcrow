from fabric import Application, Fabricator


date_fabricator = Fabricator(
    interval=500,
    poll_from="checkupdates | wc -l",
    on_changed=lambda f, v: print(f"Current Date: {v.strip()}"),
)
app = Application()
app.run()