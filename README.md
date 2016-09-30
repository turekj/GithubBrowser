# ep-assessment

### How to run

1. Run `carthage update --platform ios` before opening project.
2. Grab yourself a cup of coffee (or five).
3. Open `Source/GithubBrowser.xcodeproj` with Xcode 8.
4. Build & run.
5. Enjoy!

### Notes to self (real-world app TODOs)

Obvious things to do:

- [ ] Freeze all of the dependencies in `Cartfile`
- [ ] Add API authentication to not hit rate limit so often.
- [ ] Introduce caching to not hit rate limit so often:
    - HTTP caching (ETag header), because `304 Not Modified` does not count against rate limit.
    - Images should be cached in memory.
    - Subsequential user details fetches should be cached in memory.
    - Subsequential search calls (with same query) should be cached in memory.
- [ ] Handle errors (especially rate limiting error) on UI. Right now an empty list is returned.
- [ ] I should probably remove [Dollar](https://github.com/ankurp/Dollar) dependency, cause it is used in two lines of code only. I love functional syntax so much that I couldn't resist. :-(
