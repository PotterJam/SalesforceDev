trigger CeilingModelTrigger on Ceiling_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingModelHandler.handleAfterDelete(Trigger.old);
    }
}
