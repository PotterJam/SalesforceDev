trigger LeadModelTrigger on Lead_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadModelHandler.handleAfterDelete(Trigger.old);
    }
}
