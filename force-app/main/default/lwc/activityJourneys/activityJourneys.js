import { LightningElement, wire } from 'lwc';
import getAllActivityJourneys from '@salesforce/apex/ActivityJourneyController.getAllActivityJourneys';

export default class ActivityJourneys extends LightningElement {

    activityJourneys;
    error;

    @wire(getAllActivityJourneys)
    wiredActivityJourneys({ data, error }) {
        if (data) {
            //this.activityJourneys = data.allActivityJourneys;
            console.log('ActivityJourneys'+JSON.stringify(this.activityJourneys));
            this.activityJourneys = data.allActivityJourneys.map(journey => ({
                ...journey,
                fatigueCases: journey.fatigueCases || [],
                journeyLocations: journey.journeyLocations || []
            }));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.activityJourneys = undefined;
            console.error(error);
        }
    }

    handleUpdateActivity(event) {
        const caseId = event.target.dataset.id;
        // Implement your logic to update the activity here
        console.log('Updating activity for case: ' + caseId);
    }
}