trigger ImpactResponseTrigger on Impact_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactResponseHandler.handleAfterDelete(Trigger.old);
    }
}
