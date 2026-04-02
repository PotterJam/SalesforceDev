trigger CustomerModelTrigger on Customer_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerModelHandler.handleAfterDelete(Trigger.old);
    }
}
