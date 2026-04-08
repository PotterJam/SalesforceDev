trigger CategoryModelTrigger on Category_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryModelHandler.handleAfterDelete(Trigger.old);
    }
}
