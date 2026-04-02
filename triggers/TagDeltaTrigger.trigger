trigger TagDeltaTrigger on Tag_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
