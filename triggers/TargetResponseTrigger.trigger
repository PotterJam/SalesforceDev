trigger TargetResponseTrigger on Target_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetResponseHandler.handleAfterDelete(Trigger.old);
    }
}
