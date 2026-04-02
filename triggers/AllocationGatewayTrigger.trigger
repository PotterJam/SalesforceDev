trigger AllocationGatewayTrigger on Allocation_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
