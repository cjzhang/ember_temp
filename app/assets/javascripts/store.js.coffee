# http://emberjs.com/guides/models/using-the-store/

App.Store = DS.Store.extend(adapter: DS.FixtureAdapter.extend({
                    simulateRemoteResponse: false
                }))
