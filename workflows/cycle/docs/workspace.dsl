// Structurizr DSL. C1 and C2 at step 1, C3 at step 3.
// This file is data; nothing in the workflow runs it. Render it with
// the Structurizr tooling of your choice into docs/c4/.

workspace "<project>" "<one sentence>" {

    model {
        user = person "<who>" "<why they use it>"

        system = softwareSystem "<project>" "<responsibility>" {
            // C2: one container per crate or deployable.
            // app = container "<name>" "<responsibility>" "<tech>" {
            //     // C3: one component per module, added at step 3.
            //     // core = component "<module>" "<responsibility>"
            // }
        }

        // user -> system "<verb>"
    }

    views {
        systemContext system "C1" {
            include *
            autoLayout
        }

        container system "C2" {
            include *
            autoLayout
        }

        // component app "C3-app" {
        //     include *
        //     autoLayout
        // }

        theme default
    }
}
