trigger LeadControllerTrigger on Lead_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadControllerHandler.handleAfterDelete(Trigger.old);
    }
}
