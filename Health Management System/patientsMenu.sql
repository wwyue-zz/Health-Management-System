-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('患者基本信息', '2018', '1', 'patients', 'system/patients/index', 1, 0, 'C', '0', '0', 'system:patients:list', '#', 'admin', sysdate(), '', null, '患者基本信息菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('患者基本信息查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'system:patients:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('患者基本信息新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'system:patients:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('患者基本信息修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'system:patients:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('患者基本信息删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'system:patients:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('患者基本信息导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'system:patients:export',       '#', 'admin', sysdate(), '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('AI患者咨询', '2018', '2', 'ai-chat', 'system/ai/chat/index', 1, 0, 'C', '0', '0', 'system:ai:chat:list', 'el-icon-chat-dot-round', 'admin', sysdate(), '', null, 'AI患者咨询菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('AI患者咨询查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'system:ai:chat:query',        '#', 'admin', sysdate(), '', null, '');
