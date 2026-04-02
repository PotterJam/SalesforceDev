trigger ResolutionFilterTrigger on Resolution_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionFilterHandler.handleAfterDelete(Trigger.old);
    }
}
