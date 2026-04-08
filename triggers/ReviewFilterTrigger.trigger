trigger ReviewFilterTrigger on Review_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewFilterHandler.handleAfterDelete(Trigger.old);
    }
}
