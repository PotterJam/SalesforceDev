trigger TagFilterTrigger on Tag_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagFilterHandler.handleAfterDelete(Trigger.old);
    }
}
