trigger LeadTransformTrigger on Lead_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadTransformHandler.handleAfterDelete(Trigger.old);
    }
}
