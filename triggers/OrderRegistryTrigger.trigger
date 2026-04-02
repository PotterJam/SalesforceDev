trigger OrderRegistryTrigger on Order_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
