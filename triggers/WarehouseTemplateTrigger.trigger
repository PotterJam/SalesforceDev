trigger WarehouseTemplateTrigger on Warehouse_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
