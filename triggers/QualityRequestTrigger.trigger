trigger QualityRequestTrigger on Quality_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityRequestHandler.handleAfterDelete(Trigger.old);
    }
}
