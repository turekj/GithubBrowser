# ep-assessment

### How to run

1. Run `carthage update --platform ios` before opening the project ([Carthage v0.18+](https://github.com/Carthage/Carthage/releases/tag/0.18) required).
2. Grab yourself a cup of coffee (or five).
3. Open `Source/GithubBrowser.xcodeproj` with Xcode 8.
4. Build & run.
5. Enjoy!

### Notes for review

* API calls are not authenticated, which means they have hard rate limit. **Search API calls are limited to 5 per minute**: every search requires two API calls (users & repositories) and Github limits search quota to 10 requests per minute.
* API errors are handled gracefully, but not in a user-friendly manner: the list vanishes if something goes wrong. This might be a little misleading, since rate limit is easy to hit after a few letters (despite throttling). I have decided that for this task (since one of the requirements is *How your app will look is not that important until it's usable*) on time is better than perfect, but it could be easily fixed by binding a view model appropriately. 

### Notes to self (real-world app TODOs)

Obvious things to do:

- [ ] Handle errors (especially rate limiting error) on UI. Right now an empty list is returned.
- [ ] Add API authentication not to hit the rate limit so often.
- [ ] Freeze all of the dependencies in `Cartfile`.
- [ ] Introduce caching not to hit rate limit so often:
    - HTTP caching (ETag header), because `304 Not Modified` does not count against rate limit.
    - Subsequential search calls (with same query) should be cached in memory.
    - Subsequential user details fetches should be cached in memory.
    - Images should be cached in memory.
- [ ] I should probably remove [Dollar](https://github.com/ankurp/Dollar) dependency, cause it is used in two lines of code only. Unfortunately, I <3 functional syntax so much I couldn't resist. :-(
