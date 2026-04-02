trigger CategoryFilterTrigger on Category_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryFilterHandler.handleAfterDelete(Trigger.old);
    }
}
