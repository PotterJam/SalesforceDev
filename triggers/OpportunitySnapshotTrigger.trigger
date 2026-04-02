trigger OpportunitySnapshotTrigger on Opportunity_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunitySnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunitySnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunitySnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunitySnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunitySnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunitySnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
