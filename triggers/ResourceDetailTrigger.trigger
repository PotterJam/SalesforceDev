trigger ResourceDetailTrigger on Resource_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceDetailHandler.handleAfterDelete(Trigger.old);
    }
}
