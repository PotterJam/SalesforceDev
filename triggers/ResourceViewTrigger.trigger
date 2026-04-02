trigger ResourceViewTrigger on Resource_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceViewHandler.handleAfterDelete(Trigger.old);
    }
}
