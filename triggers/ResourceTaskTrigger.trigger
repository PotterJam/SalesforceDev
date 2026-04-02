trigger ResourceTaskTrigger on Resource_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceTaskHandler.handleAfterDelete(Trigger.old);
    }
}
