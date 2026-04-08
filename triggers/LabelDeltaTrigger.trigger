trigger LabelDeltaTrigger on Label_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
