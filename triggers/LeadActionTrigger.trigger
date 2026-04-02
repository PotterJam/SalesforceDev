trigger LeadActionTrigger on Lead_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadActionHandler.handleAfterDelete(Trigger.old);
    }
}
