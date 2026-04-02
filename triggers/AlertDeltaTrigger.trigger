trigger AlertDeltaTrigger on Alert_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
