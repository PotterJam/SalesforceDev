trigger SurveySnapshotTrigger on Survey_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveySnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveySnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveySnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveySnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveySnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveySnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
